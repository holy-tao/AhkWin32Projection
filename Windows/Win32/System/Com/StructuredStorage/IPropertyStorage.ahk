#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\PROPVARIANT.ahk
#Include .\IEnumSTATPROPSTG.ahk
#Include .\STATPROPSETSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The IPropertyStorage interface manages the persistent properties of a single property set. (IPropertyStorage interface)
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nn-propidlbase-ipropertystorage
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
     * The IPropertyStorage::ReadMultiple method reads specified properties from the current property set.
     * @param {Integer} cpspec The numeric count of properties to be specified in the <i>rgpspec</i> array. The value of this parameter can  be set to zero; however, that defeats the purpose of the method as no properties are thereby read, regardless of the values set in <i>rgpspec</i>.
     * @param {Pointer<PROPSPEC>} rgpspec An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structures specifies which properties are  read. Properties can be specified either by a property ID or by an optional string name. It is not necessary to specify properties in any particular order in the array. The array can contain duplicate properties, resulting in duplicate property values on return for simple properties. Nonsimple properties should return access denied on an attempt to open them a second time. The array can contain a mixture of property IDs and string IDs.
     * @returns {PROPVARIANT} Caller-allocated array of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that, on return, contains the values of the properties specified by the corresponding elements in the <i>rgpspec</i> array. The array must be at least large enough to hold values of the <i>cpspec</i> parameter of the 
     * <b>PROPVARIANT</b> structure. The <i>cpspec</i> parameter specifies the number of properties set in the array. The caller is not required to initialize these 
     * <b>PROPVARIANT</b> structure values in any specific  order. However, the implementation must fill all members correctly on return. If there is no other appropriate value, the implementation must set the <b>vt</b> member of each 
     * <b>PROPVARIANT</b> structure to <b>VT_EMPTY</b>.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-readmultiple
     */
    ReadMultiple(cpspec, rgpspec) {
        rgpropvar := PROPVARIANT()
        result := ComCall(3, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "HRESULT")
        return rgpropvar
    }

    /**
     * The IPropertyStorage::WriteMultiple method writes a specified group of properties to the current property set.
     * @remarks
     * If a specified property already exists, its value is replaced with the one specified in <i>rgpspec</i>, even when the old and new types for the property value are different. If the specified property does not already exist, that property is created. The changes are not persisted to the underlying storage until <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-commit">IPropertyStorage::Commit</a> has been called.
     * 
     * Property names are stored in a special dictionary section of the property set, which maps such names to property IDs. All properties have an ID, but names are optional. A string name is supplied by specifying PRSPEC_LPWSTR in the <b>ulKind</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structure. If a string name is supplied for a property, and the name does not already exist in the dictionary, the method will allocate a property ID, and add the property ID and the name to the dictionary. The property ID is allocated in such a way that it does not conflict with other IDs in the property set. The value of the property ID also is no less than the value specified by the <i>propidNameFirst</i> parameter. If the <i>rgpspec</i> parameter specifies string-named properties for which no property IDs currently exist, the <i>propidNameFirst</i> parameter specifies the minimum value for the property IDs that the 
     * <b>WriteMultiple</b> method must assign.
     * 
     * When a new property set is created, the special <b>codepage (</b><a href="https://msdn.microsoft.com/">Property ID 1</a><b>)</b> and <b>Locale ID (</b><a href="https://msdn.microsoft.com/">Property ID 0x80000000</a><b>)</b> properties are written to the property set automatically. These properties can subsequently be read, using the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-readmultiple">IPropertyStorage::ReadMultiple</a> method, by specifying property IDs with the header-defined PID_CODEPAGE and PID_LOCALE values, respectively. If a property set is non-empty — has one or more properties in addition to the <b>codepage</b> and <b>Locale ID</b> properties or has one or more names in its dictionary — the special <b>codepage</b> and <b>Locale ID</b> properties cannot be modified by calling <b>IPropertyStorage::WriteMultiple</b>. However, if the property set is empty, one or both of these special properties can be modified.
     * 
     * If an element in the <i>rgspec</i> array is set with a PRSPEC_PROPID value of 0xffffffff (PID_ILLEGAL), the corresponding value in the <i>rgvar</i> array is ignored by <b>IPropertyStorage::WriteMultiple</b>. For example, if this method is called with the <i>cspec</i> parameter set to 3, but <i>rgpspec[1].prspec</i> is set to PRSPEC_PROPID and <i>rgpspec[1].propid</i> is set to PID_ILLEGAL, only two properties will be written. The <i>rgpropvar[1]</i> element is silently ignored.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantinit">PropVariantInit</a> macro to initialize 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures.
     * 
     * Property sets, not including the data for nonsimple properties, are limited to 256 KB in size for Windows NT 4.0 and earlier. For Windows 2000, Windows XP and Windows Server 2003, OLE property sets are limited to 1 MB.  If these limits are exceeded, the operation fails and the caller receives an error message. There is no possibility of a memory leak or overrun. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/managing-property-sets">Managing Property Sets</a>.
     * 
     * Unless PROPSETFLAG_CASE_SENSITIVE is passed to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>, property set names are case insensitive. Specifying a property by its name in <b>IPropertyStorage::WriteMultiple</b> will result in a case-insensitive search of the names in the property set. To compare case-insensitive strings, the locale of the strings must be known. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writepropertynames">IPropertyStorage::WritePropertyNames</a>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/property-storage-considerations">Property Storage Considerations</a>.
     * @param {Integer} cpspec The number of properties set. The value of this parameter can be set to zero; however, this defeats the purpose of the method as no properties are then written.
     * @param {Pointer<PROPSPEC>} rgpspec An array of the property IDs (<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a>) to which properties are set. These need not be in any particular order, and may contain duplicates, however the last specified property ID is the one that takes effect. A mixture of property IDs and string names is permitted.
     * @param {Pointer<PROPVARIANT>} rgpropvar An array (of size <i>cpspec</i>) of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures that contain the property values to be written. The array must be the size specified by <i>cpspec</i>.
     * @param {Integer} propidNameFirst The minimum value for the property IDs that the method must assign if the <i>rgpspec</i> parameter specifies string-named properties for which no property IDs currently exist. If all string-named properties specified already exist in this set, and thus already have property IDs, this value is ignored. When not ignored, this value must be greater than, or equal to, two and less than 0x80000000. Property IDs 0 and 1 and greater than 0x80000000 are reserved for special use.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * 
     * This function can also return any file system errors or Win32 errors wrapped in an <b>HRESULT</b> data type. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-writemultiple
     */
    WriteMultiple(cpspec, rgpspec, rgpropvar, propidNameFirst) {
        result := ComCall(4, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "uint", propidNameFirst, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::DeleteMultiple method deletes as many of the indicated properties as exist in a property set.
     * @remarks
     * <b>IPropertyStorage::DeleteMultiple</b> must delete as many of the indicated properties as are in the current property set. If a deletion of a stream- or storage-valued property occurs while that property is open, the deletion will succeed and place the previously returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer in the reverted state.
     * @param {Integer} cpspec The numerical count of properties to be deleted. The value of this parameter can  legally be set to zero, however that defeats the purpose of the method as no properties are thereby deleted, regardless of the value set in <i>rgpspec</i>.
     * @param {Pointer<PROPSPEC>} rgpspec Properties to be deleted. A mixture of property identifiers and string-named properties is permitted. There may be duplicates, and there is no requirement that properties be specified in any order.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-deletemultiple
     */
    DeleteMultiple(cpspec, rgpspec) {
        result := ComCall(5, this, "uint", cpspec, "ptr", rgpspec, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::ReadPropertyNames method retrieves any existing string names for the specified property IDs.
     * @remarks
     * For each property ID in the list of property IDs supplied in the <i>rgpropid</i> array, <b>ReadPropertyNames</b> retrieves the corresponding string name, if there is one. String names are created either by specifying the names in calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writemultiple">IPropertyStorage::WriteMultiple</a> when creating the property, or through a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writepropertynames">IPropertyStorage::WritePropertyNames</a>. In either case, the string name is optional, however all properties must have a property ID.
     * 
     * String names mapped to property IDs must be unique within the set.
     * @param {Integer} cpropid The number of elements on input of the array <i>rgpropid</i>.  The value of this parameter can be set to zero, however that defeats the purpose of this method as no property names are thereby read.
     * @param {Pointer<Integer>} rgpropid An array of property IDs for which names are to be retrieved.
     * @returns {PWSTR} A caller-allocated array of size <i>cpropid</i> of <b>LPWSTR</b> members. On return, the implementation fills in this array. A given entry contains either the corresponding string name of a property ID or it can be empty if the property ID has no string names.
     * 
     * Each <b>LPWSTR</b> member of the array should be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-readpropertynames
     */
    ReadPropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", cpropid, rgpropidMarshal, rgpropid, "ptr*", &rglpwstrName := 0, "HRESULT")
        return rglpwstrName
    }

    /**
     * The IPropertyStorage::WritePropertyNames method assigns string IPropertyStoragenames to a specified array of property IDs in the current property set.
     * @remarks
     * For more information about property sets and memory management, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/managing-property-sets">Managing Property Sets</a>.
     * 
     * <b>IPropertyStorage::WritePropertyNames</b> assigns string names to property IDs passed to the method in the <i>rgpropid</i> array. It associates each string name in the <i>rglpwstrName</i> array with the respective property ID in <i>rgpropid</i>. It is explicitly valid to define a name for a property ID that is not currently present in the property storage object.
     * 
     * It is also valid to change the mapping for an existing string name (determined by a case-insensitive match). That is, you can use the 
     * <b>WritePropertyNames</b> method to map an existing name to a new property ID, or to map a new name to a property ID that already has a name in the dictionary. In either case, the original mapping is deleted. Property names must be unique (as are property IDs) within the property set.
     * 
     * The storage of string property names preserves the case. Unless <b>PROPSETFLAG_CASE_SENSITIVE</b> is passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>, property set names are case insensitive by default. With case-insensitive property sets, the name strings passed by the caller are interpreted according to the locale of the property set, as specified by the <b>PID_LOCALE</b> property. If the property set has no locale property, the current user is assumed by default. String property names are limited in length to 128 characters. Property names that begin with the binary Unicode characters 0x0001 through 0x001F are reserved for future use.
     * 
     * If the value of an element in the <i>rgpropid</i> array parameter is set to 0xffffffff (PID_ILLEGAL), the corresponding name is ignored by <b>IPropertyStorage::WritePropertyNames</b>. For example, if this method is called with a <i>cpropid</i> parameter of 3, but the first element of the array, <i>rgpropid[1]</i>, is set to <b>PID_ILLEGAL</b>, then only two property names are written. The <i>rgpropid[1]</i> element is ignored.
     * @param {Integer} cpropid The size on input of the array <i>rgpropid</i>. Can be zero.  However, making it zero causes this method to become non-operational.
     * @param {Pointer<Integer>} rgpropid An array of the property IDs for which names are to be set.
     * @param {Pointer<PWSTR>} rglpwstrName An array of new names to be assigned to the corresponding property IDs in the <i>rgpropid</i> array. These names may not exceed 255 characters (not including the <b>NULL</b> terminator).
     * @returns {HRESULT} This method supports the standard return value <b>E_UNEXPECTED</b>, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-writepropertynames
     */
    WritePropertyNames(cpropid, rgpropid, rglpwstrName) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"
        rglpwstrNameMarshal := rglpwstrName is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", cpropid, rgpropidMarshal, rgpropid, rglpwstrNameMarshal, rglpwstrName, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::DeletePropertyNames method deletes specified string names from the current property set.
     * @remarks
     * For each property identifier in <i>rgpropid</i>, <b>IPropertyStorage::DeletePropertyNames</b> removes any corresponding name-to-property ID mapping. An attempt is silently ignored to delete the name of a property that either does not exist or does not currently have a string name associated with it. This method has no effect on the properties themselves.
     * 
     * <div class="alert"><b>Note</b>  All the stored string property names can be deleted by deleting property identifier zero, but <i>cpropid</i> must be equal to 1 for this to be a valid parameter error.</div>
     * <div> </div>
     * @param {Integer} cpropid The size on input of the array <i>rgpropid</i>. If 0, no property names are deleted.
     * @param {Pointer<Integer>} rgpropid Property identifiers for which string names are to be deleted.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-deletepropertynames
     */
    DeletePropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", cpropid, rgpropidMarshal, rgpropid, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::Commit method saves changes made to a property storage object to the parent storage object.
     * @remarks
     * Like <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a>, the <b>IPropertyStorage::Commit</b> method ensures that any changes made to a property storage object are reflected in the parent storage.
     * 
     * In direct mode in the compound file implementation, a call to this method causes any changes currently in the memory buffers to be flushed to the underlying property stream. In the compound-file implementation for nonsimple property sets, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> is also called on the underlying substorage object with the passed <i>grfCommitFlags</i> parameter.
     * 
     * In transacted mode, this method causes the changes to be permanently reflected in the persistent image of the storage object. The changes that are committed must have been made to this property set since it was opened or since the last commit on this opening of the property set.  The <b>commit</b> method publishes the changes made on one object level to the next level. Of course, this remains subject to any outer-level transaction that may be present on the object in which this property set is contained. Write permission must be specified when the property set is opened (through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>) on the property set opening for the commit operation to succeed.
     * 
     * If the commit operation fails for any reason, the state of the property storage object remains as it was before the commit.
     * 
     * This call has no effect on existing storage- or stream-valued properties opened from this property storage, but it does commit them.
     * 
     * Valid values for the <i>grfCommitFlags</i> parameter are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>STGC_DEFAULT</td>
     * <td>Commits per the usual transaction semantics. Last writer wins. This flag may not be specified with other flag values.</td>
     * </tr>
     * <tr>
     * <td>STGC_ONLYIFCURRENT</td>
     * <td>Commits the changes only if the current persistent contents of the property set are the ones on which the changes about to be committed are based. That is, does not commit changes if the contents of the property set have been changed by a commit from another opening of the property set. The error STG_E_NOTCURRENT is returned if the commit does not succeed for this reason.</td>
     * </tr>
     * <tr>
     * <td>STGC_OVERWRITE</td>
     * <td>Useful only when committing a transaction that has no further outer nesting level of transactions, though acceptable in all cases. <div class="alert"><b>Note</b>  Indicates that the caller is willing to risk some data corruption at the expense of decreased disk usage on the destination volume. This flag is potentially useful in low disk-space scenarios, though it should be used with caution.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Using <b>IPropertyStorage::Commit</b> to write properties to image files on Windows XP does not work.  Affected image file formats include:<ul>
     * <li>.bmp</li>
     * <li>.dib</li>
     * <li>.emf</li>
     * <li>.gif</li>
     * <li>.ico</li>
     * <li>.jfif</li>
     * <li>.jpe</li>
     * <li>.jpeg</li>
     * <li>.jpg</li>
     * <li>.png</li>
     * <li>.rle</li>
     * <li>.tiff</li>
     * <li>.wmf</li>
     * </ul>Due to a bug in the image file property handler on Windows XP, calling <b>IPropertyStorage::Commit</b> actually discards any changes made rather than persisting them.
     * 
     *  
     * 
     * A workaround is to
     * 
     * omit the call to <b>IPropertyStorage::Commit</b>. Calling IUnknown::Release on the XP image file property handler without calling <b>IPropertyStorage::Commit</b> first implicitly commits the changes to the file.  Note that in general, calling IUnknown::Release without first calling <b>IPropertyStorage::Commit</b> will discard any changes made; this workaround is specific to the image file property handler on Windows XP.  Also note that on later versions of Windows, this component functions properly (that is, calling <b>IPropertyStorage::Commit</b> persists changes and calling IUnknown::Release without calling <b>IPropertyStorage::Commit</b> discards them).
     * 
     * </div>
     * <div> </div>
     * @param {Integer} grfCommitFlags The flags that specify the conditions under which the commit is to be performed. For more information about specific flags and their meanings, see the Remarks section.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::Revert method discards all changes to the named property set since it was last opened or discards changes that were last committed to the property set.
     * @remarks
     * For transacted-mode property sets, this method discards all changes that have been made in this property set since the set was opened or since the time it was last committed, (whichever is later). After this operation, any existing storage- or stream-valued properties that have been opened from the property set being reverted are no longer valid and cannot be used. The error STG_E_REVERTED will be returned on all calls, except those to <b>Release</b>, using these streams or storages.
     * 
     * For direct-mode property sets, this request is ignored and returns S_OK.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-revert
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::Enum method creates an enumerator object designed to enumerate data of type STATPROPSTG, which contains information on the current property set.
     * @remarks
     * <b>IPropertyStorage::Enum</b> creates an enumeration object that can be used to iterate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures. On return, this method supplies a pointer to an instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropstg">IEnumSTATPROPSTG</a> interface on this object, whose methods you can call to obtain information about the current property set.
     * @returns {IEnumSTATPROPSTG} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropstg">IEnumSTATPROPSTG</a> pointer variable that receives the interface pointer to the new enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-enum
     */
    Enum() {
        result := ComCall(11, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSTG(ppenum)
    }

    /**
     * The IPropertyStorage::SetTimes method sets the modification, access, and creation times of this property set, if supported by the implementation.
     * @remarks
     * Sets the modification, access, and creation times of the current open property set, if supported by the implementation (not all implementations support all these time values). Unsupported time stamps are always reported as zero, enabling the caller to test for support. A call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-stat">IPropertyStorage::Stat</a> supplies (among other data) time-stamp information.
     * 
     * Notice that this functionality is provided as an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> method on a property-storage object that is already open, in contrast to being provided as a method in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>. Normally, when the 
     * <b>SetTimes</b> method is not explicitly called, the access and modification times are updated as a side effect of reading and writing the property set. When 
     *  <b>SetTimes</b> is used, the latest specified times supersede either default times or time values specified in previous calls to 
     * <b>SetTimes</b>.
     * @param {Pointer<FILETIME>} pctime Pointer to the new creation time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @param {Pointer<FILETIME>} patime Pointer to the new access time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @param {Pointer<FILETIME>} pmtime Pointer to the new modification time for the property set. May be <b>NULL</b>, indicating that this time is not to be modified by this call.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-settimes
     */
    SetTimes(pctime, patime, pmtime) {
        result := ComCall(12, this, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::SetClass method assigns a new CLSID to the current property storage object, and persistently stores the CLSID with the object.
     * @remarks
     * Assigns a CLSID to the current property storage object. The CLSID has no relationship to the stored property IDs. Assigning a CLSID allows a piece of code to be associated with a given instance of a property set; such code, for example, might manage the user interface (UI). Different CLSIDs can be associated with different property set instances that have the same FMTID.
     * 
     * If the property set is created with the <i>pclsid</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a> method specified as <b>NULL</b>, the CLSID is set to all zeroes.
     * 
     * The current CLSID on a property storage object can be retrieved with a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-stat">IPropertyStorage::Stat</a>. The initial value for the CLSID can be specified at the time that the storage is created with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>.
     * 
     * Setting the CLSID on a nonsimple property set (one that can legally contain storage- or stream-valued properties, as described in <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>) also sets the CLSID on the underlying sub-storage.
     * @param {Pointer<Guid>} clsid New CLSID to be associated with the property set.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-setclass
     */
    SetClass(clsid) {
        result := ComCall(13, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * The IPropertyStorage::Stat method retrieves information about the current open property set. (IPropertyStorage.Stat)
     * @remarks
     * <b>IPropertyStorage::Stat</b> fills in and returns a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structure, containing statistics about the current property set.
     * @returns {STATPROPSETSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structure, which contains statistics about the current open property set.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-stat
     */
    Stat() {
        pstatpsstg := STATPROPSETSTG()
        result := ComCall(14, this, "ptr", pstatpsstg, "HRESULT")
        return pstatpsstg
    }
}
