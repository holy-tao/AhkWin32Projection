#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IPropertyStorage interface manages the persistent properties of a single property set.
 * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nn-propidlbase-ipropertystorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStorage
     * @type {Guid}
     */
    static IID => Guid("{00000138-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadMultiple", "WriteMultiple", "DeleteMultiple", "ReadPropertyNames", "WritePropertyNames", "DeletePropertyNames", "Commit", "Revert", "Enum", "SetTimes", "SetClass", "Stat"]

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @param {Pointer<PROPVARIANT>} rgpropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-readmultiple
     */
    ReadMultiple(cpspec, rgpspec, rgpropvar) {
        result := ComCall(3, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @param {Pointer<PROPVARIANT>} rgpropvar 
     * @param {Integer} propidNameFirst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-writemultiple
     */
    WriteMultiple(cpspec, rgpspec, rgpropvar, propidNameFirst) {
        result := ComCall(4, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "uint", propidNameFirst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-deletemultiple
     */
    DeleteMultiple(cpspec, rgpspec) {
        result := ComCall(5, this, "uint", cpspec, "ptr", rgpspec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @param {Pointer<PWSTR>} rglpwstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-readpropertynames
     */
    ReadPropertyNames(cpropid, rgpropid, rglpwstrName) {
        result := ComCall(6, this, "uint", cpropid, "uint*", rgpropid, "ptr", rglpwstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @param {Pointer<PWSTR>} rglpwstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-writepropertynames
     */
    WritePropertyNames(cpropid, rgpropid, rglpwstrName) {
        result := ComCall(7, this, "uint", cpropid, "uint*", rgpropid, "ptr", rglpwstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-deletepropertynames
     */
    DeletePropertyNames(cpropid, rgpropid) {
        result := ComCall(8, this, "uint", cpropid, "uint*", rgpropid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-revert
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATPROPSTG>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-enum
     */
    Enum(ppenum) {
        result := ComCall(11, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pctime 
     * @param {Pointer<FILETIME>} patime 
     * @param {Pointer<FILETIME>} pmtime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-settimes
     */
    SetTimes(pctime, patime, pmtime) {
        result := ComCall(12, this, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-setclass
     */
    SetClass(clsid) {
        result := ComCall(13, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STATPROPSETSTG>} pstatpsstg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-stat
     */
    Stat(pstatpsstg) {
        result := ComCall(14, this, "ptr", pstatpsstg, "HRESULT")
        return result
    }
}
