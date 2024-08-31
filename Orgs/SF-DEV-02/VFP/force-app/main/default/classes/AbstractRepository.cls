public abstract with sharing class AbstractRepository {
    virtual
    public SObject save(SObject record) {
        save(new List<SObject> {record});
        return record;
    }

    virtual
    public List<SObject> save(List<SObject> records) {
        if(records == null || records.isEmpty()){
            return records;
        }
        // Salva os registros na lista de objetos. True se refere ao All or Nothing, que impede a inserção de todos os registros caso ocorra uma falha.
        Database.upsert(records, true, AccessLevel.USER_MODE);
        return records;
    }

    virtual
    public void remove(SObject record) {
        remove(new List<SObject> {record});
    }

    virtual
    public void remove(List<SObject> records) {
        if(records == null || records.isEmpty()){
            return;
        }
        // Deleta os registros na lista de objetos. True se refere ao All or Nothing, que impede a inserção de todos os registros caso ocorra uma falha.
        Database.delete(records, true, AccessLevel.USER_MODE);
    }
}