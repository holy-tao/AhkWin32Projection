#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUTHENTICATION_INFO.ahk" { AUTHENTICATION_INFO }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import ".\INCREMENTAL_ACCESS_INFO.ahk" { INCREMENTAL_ACCESS_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IUrlAccessor.ahk" { IUrlAccessor }
#Import ".\ISearchProtocol.ahk" { ISearchProtocol }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITEM_INFO.ahk" { ITEM_INFO }

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects. (ISearchProtocol2)
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchprotocol2
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchProtocol2 extends ISearchProtocol {
    /**
     * The interface identifier for ISearchProtocol2
     * @type {Guid}
     */
    static IID := Guid("{7789f0b2-b5b2-4722-8b65-5dbd150697a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchProtocol2 interfaces
    */
    struct Vtbl extends ISearchProtocol.Vtbl {
        CreateAccessorEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchProtocol2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates and initializes an IUrlAccessor object. This method has the same basic functionality as the ISearchProtocol::CreateAccessor method, but it includes an additional pUserData parameter to supply additional data to the protocol handler.
     * @remarks
     * This method creates and initializes an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object to process an item currently being accessed by the gatherer. The protocol host calls this method on the protocol handler. This method is called once for every URL processed by the gatherer and retrieves a pointer to the <b>IUrlAccessor</b> object.
     * @param {PWSTR} pcwszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item being accessed.
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a> structure that contains authentication information necessary for accessing this item in the content source.
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a> structure that contains incremental access information, such as the last time the file was accessed by the gatherer.
     * @param {Pointer<ITEM_INFO>} pItemInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a> structure that contains information about the URL item, such as the name of the item's workspace catalog.
     * @param {Pointer<BLOB>} pUserData Type: <b>const BLOB*</b>
     * 
     * Pointer to user information. This data can be whatever the notification originator decides. If the protocol handler implements this interface, it will receive this data.  Not all notifications have this blob set.
     * @returns {IUrlAccessor} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object created by this method. This object contains information about the URL item, such as the item's file name.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol2-createaccessorex
     */
    CreateAccessorEx(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo, pUserData) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(7, this, "ptr", pcwszURL, AUTHENTICATION_INFO.Ptr, pAuthenticationInfo, INCREMENTAL_ACCESS_INFO.Ptr, pIncrementalAccessInfo, ITEM_INFO.Ptr, pItemInfo, BLOB.Ptr, pUserData, "ptr*", &ppAccessor := 0, "HRESULT")
        return IUrlAccessor(ppAccessor)
    }

    Query(iid) {
        if (ISearchProtocol2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateAccessorEx := CallbackCreate(GetMethod(implObj, "CreateAccessorEx"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateAccessorEx)
    }
}
