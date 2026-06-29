#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\StructuredStorage\IPropertyBag.ahk" { IPropertyBag }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages configuration settings for each listener for the dynamic virtual channel (DVC) connection.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistener
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSListener extends IUnknown {
    /**
     * The interface identifier for IWTSListener
     * @type {Guid}
     */
    static IID := Guid("{a1230206-9a39-4d58-8674-cdb4dff4e73b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConfiguration : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the listener-specific configuration.
     * @returns {IPropertyBag} Output parameter that receives the property bag.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtslistener-getconfiguration
     */
    GetConfiguration() {
        result := ComCall(3, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPropertyBag(ppPropertyBag)
    }

    Query(iid) {
        if (IWTSListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConfiguration := CallbackCreate(GetMethod(implObj, "GetConfiguration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConfiguration)
    }
}
