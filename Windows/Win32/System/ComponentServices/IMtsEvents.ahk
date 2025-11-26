#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for obtaining information about the running package and establishing event sinks.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtsevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMtsEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMtsEvents
     * @type {Guid}
     */
    static IID => Guid("{bacedf4d-74ab-11d0-b162-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageName", "get_PackageGuid", "PostEvent", "get_FireEvents", "GetProcessID"]

    /**
     * @type {BSTR} 
     */
    PackageName {
        get => this.get_PackageName()
    }

    /**
     * @type {BSTR} 
     */
    PackageGuid {
        get => this.get_PackageGuid()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FireEvents {
        get => this.get_FireEvents()
    }

    /**
     * Retrieves the name of the package in which the instance of the object that implements the IMtsEvents interface is running.
     * @returns {BSTR} A pointer to the package name string.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtsevents-get_packagename
     */
    get_PackageName() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the globally unique identifier (GUID) for the package in which the event occurred.
     * @returns {BSTR} A pointer to the package GUID.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtsevents-get_packageguid
     */
    get_PackageGuid() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Posts a user-defined event to an event sink.
     * @param {Pointer<VARIANT>} vEvent A pointer to the name of the event.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtsevents-postevent
     */
    PostEvent(vEvent) {
        result := ComCall(9, this, "ptr", vEvent, "HRESULT")
        return result
    }

    /**
     * Retrieves whether events are enabled or disabled for an event sink.
     * @returns {VARIANT_BOOL} Indicates whether events are enabled or disabled for an event sink.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtsevents-get_fireevents
     */
    get_FireEvents() {
        result := ComCall(10, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the identifier of the process in which the event occurred.
     * @returns {Integer} A pointer to the process identification for the event.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtsevents-getprocessid
     */
    GetProcessID() {
        result := ComCall(11, this, "int*", &id := 0, "HRESULT")
        return id
    }
}
