#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmMutableCollection.ahk

/**
 * Defines a collection of FSRM objects that can have the same type of objects added to or removed from the collection. All objects in the collection can also be committed in a single batch operation.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmcommittablecollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmCommittableCollection extends IFsrmMutableCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmCommittableCollection
     * @type {Guid}
     */
    static IID => Guid("{96deb3b5-8b91-4a2a-9d93-80a35d8aa847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit"]

    /**
     * Commits all the objects of the collection and returns the commit results for each object.
     * @param {Integer} options One or more options to use when committing the collection of objects. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @returns {IFsrmCollection} A collection of <b>HRESULT</b> values that correspond directly to the objects in the 
     *        collection. The <b>HRESULT</b> value indicates the success or failure of committing the 
     *        object.
     * 
     * If the method returns <b>FSRM_S_PARTIAL_BATCH</b> or 
     *        <b>FSRM_E_FAIL_BATCH</b>, check the results.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcommittablecollection-commit
     */
    Commit(options) {
        result := ComCall(18, this, "int", options, "ptr*", &results := 0, "HRESULT")
        return IFsrmCollection(results)
    }
}
