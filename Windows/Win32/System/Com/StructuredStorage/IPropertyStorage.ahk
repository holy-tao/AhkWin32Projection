#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\PROPVARIANT.ahk
#Include .\IEnumSTATPROPSTG.ahk
#Include .\STATPROPSETSTG.ahk
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
     * Reads specified properties from the current property set.
     * @param {Integer} cpspec The numeric count of properties to be specified in the <i>rgpspec</i> array. The value of this parameter can  be set to zero; however, that defeats the purpose of the method as no properties are thereby read, regardless of the values set in <i>rgpspec</i>.
     * @param {Pointer<PROPSPEC>} rgpspec An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structures specifies which properties are  read. Properties can be specified either by a property ID or by an optional string name. It is not necessary to specify properties in any particular order in the array. The array can contain duplicate properties, resulting in duplicate property values on return for simple properties. Nonsimple properties should return access denied on an attempt to open them a second time. The array can contain a mixture of property IDs and string IDs.
     * @returns {PROPVARIANT} Caller-allocated array of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that, on return, contains the values of the properties specified by the corresponding elements in the <i>rgpspec</i> array. The array must be at least large enough to hold values of the <i>cpspec</i> parameter of the 
     * <b>PROPVARIANT</b> structure. The <i>cpspec</i> parameter specifies the number of properties set in the array. The caller is not required to initialize these 
     * <b>PROPVARIANT</b> structure values in any specific  order. However, the implementation must fill all members correctly on return. If there is no other appropriate value, the implementation must set the <b>vt</b> member of each 
     * <b>PROPVARIANT</b> structure to <b>VT_EMPTY</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-readmultiple
     */
    ReadMultiple(cpspec, rgpspec) {
        rgpropvar := PROPVARIANT()
        result := ComCall(3, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "HRESULT")
        return rgpropvar
    }

    /**
     * Writes a specified group of properties to the current property set.
     * @param {Integer} cpspec The number of properties set. The value of this parameter can be set to zero; however, this defeats the purpose of the method as no properties are then written.
     * @param {Pointer<PROPSPEC>} rgpspec An array of the property IDs (<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a>) to which properties are set. These need not be in any particular order, and may contain duplicates, however the last specified property ID is the one that takes effect. A mixture of property IDs and string names is permitted.
     * @param {Pointer<PROPVARIANT>} rgpropvar An array (of size <i>cpspec</i>) of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures that contain the property values to be written. The array must be the size specified by <i>cpspec</i>.
     * @param {Integer} propidNameFirst The minimum value for the property IDs that the method must assign if the <i>rgpspec</i> parameter specifies string-named properties for which no property IDs currently exist. If all string-named properties specified already exist in this set, and thus already have property IDs, this value is ignored. When not ignored, this value must be greater than, or equal to, two and less than 0x80000000. Property IDs 0 and 1 and greater than 0x80000000 are reserved for special use.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * 
     * This function can also return any file system errors or Win32 errors wrapped in an <b>HRESULT</b> data type. For more information, see 
     * <a href="/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a>.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-writemultiple
     */
    WriteMultiple(cpspec, rgpspec, rgpropvar, propidNameFirst) {
        result := ComCall(4, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "uint", propidNameFirst, "HRESULT")
        return result
    }

    /**
     * The DeleteMultiple method deletes as many of the indicated properties as exist in this property set.
     * @param {Integer} cpspec The numerical count of properties to be deleted. The value of this parameter can  legally be set to zero, however that defeats the purpose of the method as no properties are thereby deleted, regardless of the value set in <i>rgpspec</i>.
     * @param {Pointer<PROPSPEC>} rgpspec Properties to be deleted. A mixture of property identifiers and string-named properties is permitted. There may be duplicates, and there is no requirement that properties be specified in any order.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-deletemultiple
     */
    DeleteMultiple(cpspec, rgpspec) {
        result := ComCall(5, this, "uint", cpspec, "ptr", rgpspec, "HRESULT")
        return result
    }

    /**
     * Retrieves any existing string names for the specified property IDs.
     * @param {Integer} cpropid The number of elements on input of the array <i>rgpropid</i>.  The value of this parameter can be set to zero, however that defeats the purpose of this method as no property names are thereby read.
     * @param {Pointer<Integer>} rgpropid An array of property IDs for which names are to be retrieved.
     * @returns {PWSTR} A caller-allocated array of size <i>cpropid</i> of <b>LPWSTR</b> members. On return, the implementation fills in this array. A given entry contains either the corresponding string name of a property ID or it can be empty if the property ID has no string names.
     * 
     * Each <b>LPWSTR</b> member of the array should be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-readpropertynames
     */
    ReadPropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", cpropid, rgpropidMarshal, rgpropid, "ptr*", &rglpwstrName := 0, "HRESULT")
        return rglpwstrName
    }

    /**
     * Assigns string IPropertyStoragenames to a specified array of property IDs in the current property set.
     * @param {Integer} cpropid The size on input of the array <i>rgpropid</i>. Can be zero.  However, making it zero causes this method to become non-operational.
     * @param {Pointer<Integer>} rgpropid An array of the property IDs for which names are to be set.
     * @param {Pointer<PWSTR>} rglpwstrName An array of new names to be assigned to the corresponding property IDs in the <i>rgpropid</i> array. These names may not exceed 255 characters (not including the <b>NULL</b> terminator).
     * @returns {HRESULT} This method supports the standard return value <b>E_UNEXPECTED</b>, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-writepropertynames
     */
    WritePropertyNames(cpropid, rgpropid, rglpwstrName) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"
        rglpwstrNameMarshal := rglpwstrName is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", cpropid, rgpropidMarshal, rgpropid, rglpwstrNameMarshal, rglpwstrName, "HRESULT")
        return result
    }

    /**
     * The DeletePropertyNames method deletes specified string names from the current property set.
     * @param {Integer} cpropid The size on input of the array <i>rgpropid</i>. If 0, no property names are deleted.
     * @param {Pointer<Integer>} rgpropid Property identifiers for which string names are to be deleted.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-deletepropertynames
     */
    DeletePropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", cpropid, rgpropidMarshal, rgpropid, "HRESULT")
        return result
    }

    /**
     * Saves changes made to a property storage object to the parent storage object.
     * @param {Integer} grfCommitFlags The flags that specify the conditions under which the commit is to be performed. For more information about specific flags and their meanings, see the Remarks section.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, as well as the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * The Revert method discards all changes to the named property set since it was last opened or discards changes that were last committed to the property set. This method has no effect on a direct-mode property set.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-revert
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Enum method creates an enumerator object designed to enumerate data of type STATPROPSTG, which contains information on the current property set. On return, this method supplies a pointer to the IEnumSTATPROPSTG pointer on this object.
     * @returns {IEnumSTATPROPSTG} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropstg">IEnumSTATPROPSTG</a> pointer variable that receives the interface pointer to the new enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-enum
     */
    Enum() {
        result := ComCall(11, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSTG(ppenum)
    }

    /**
     * The SetTimes method sets the modification, access, and creation times of this property set, if supported by the implementation. Not all implementations support all these time values.
     * @param {Pointer<FILETIME>} pctime Pointer to the new creation time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @param {Pointer<FILETIME>} patime Pointer to the new access time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @param {Pointer<FILETIME>} pmtime Pointer to the new modification time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-settimes
     */
    SetTimes(pctime, patime, pmtime) {
        result := ComCall(12, this, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * The SetClass method assigns a new CLSID to the current property storage object, and persistently stores the CLSID with the object.
     * @param {Pointer<Guid>} clsid New CLSID to be associated with the property set.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-setclass
     */
    SetClass(clsid) {
        result := ComCall(13, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * The Stat method retrieves information about the current open property set.
     * @returns {STATPROPSETSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structure, which contains statistics about the current open property set.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ipropertystorage-stat
     */
    Stat() {
        pstatpsstg := STATPROPSETSTG()
        result := ComCall(14, this, "ptr", pstatpsstg, "HRESULT")
        return pstatpsstg
    }
}
