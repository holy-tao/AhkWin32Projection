#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IProvideClassInfo2.ahk" { IProvideClassInfo2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MULTICLASSINFO_FLAGS.ahk" { MULTICLASSINFO_FLAGS }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }

/**
 * An extension to IProvideClassInfo2 that makes it faster and easier to retrieve type information from a component that may have multiple coclasses that determine its behavior.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iprovidemultipleclassinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProvideMultipleClassInfo extends IProvideClassInfo2 {
    /**
     * The interface identifier for IProvideMultipleClassInfo
     * @type {Guid}
     */
    static IID := Guid("{a7aba9c1-8983-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideMultipleClassInfo interfaces
    */
    struct Vtbl extends IProvideClassInfo2.Vtbl {
        GetMultiTypeInfoCount : IntPtr
        GetInfoOfIndex        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideMultipleClassInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of type information blocks that this object must provide.
     * @returns {Integer} The number of type information blocks that this object must provide.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iprovidemultipleclassinfo-getmultitypeinfocount
     */
    GetMultiTypeInfoCount() {
        result := ComCall(5, this, "uint*", &pcti := 0, "HRESULT")
        return pcti
    }

    /**
     * Retrieves the type information from the specified index.
     * @param {Integer} iti The index of the type information for which you want to obtain information. Index 0 is the default interface of the extender object; index *pcti-1 is the index of the base object.
     * @param {MULTICLASSINFO_FLAGS} dwFlags 
     * @param {Pointer<ITypeInfo>} pptiCoClass The <a href="https://msdn.microsoft.com/">coclass</a> type information for the requested contributor. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>.
     * @param {Pointer<Integer>} pdwTIFlags The bitfield flag.
     * @param {Pointer<Integer>} pcdispidReserved The number of DISPIDs the default interface of <i>pptiCoClass</i> reserves for its own use. This number can be used to calculate the amount to offset DISPIDs in the reserved range implemented by the object this class is extending.
     * @param {Pointer<Guid>} piidPrimary The IID of the primary interface for the requested contributor.
     * @param {Pointer<Guid>} piidSource The IID of the default source interface for the requested contributor.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_POINTER, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iprovidemultipleclassinfo-getinfoofindex
     */
    GetInfoOfIndex(iti, dwFlags, pptiCoClass, pdwTIFlags, pcdispidReserved, piidPrimary, piidSource) {
        pdwTIFlagsMarshal := pdwTIFlags is VarRef ? "uint*" : "ptr"
        pcdispidReservedMarshal := pcdispidReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iti, MULTICLASSINFO_FLAGS, dwFlags, ITypeInfo.Ptr, pptiCoClass, pdwTIFlagsMarshal, pdwTIFlags, pcdispidReservedMarshal, pcdispidReserved, Guid.Ptr, piidPrimary, Guid.Ptr, piidSource, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProvideMultipleClassInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMultiTypeInfoCount := CallbackCreate(GetMethod(implObj, "GetMultiTypeInfoCount"), flags, 2)
        this.vtbl.GetInfoOfIndex := CallbackCreate(GetMethod(implObj, "GetInfoOfIndex"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMultiTypeInfoCount)
        CallbackFree(this.vtbl.GetInfoOfIndex)
    }
}
