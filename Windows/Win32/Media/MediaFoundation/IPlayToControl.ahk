#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSharingEngineClassFactory.ahk" { IMFSharingEngineClassFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the PlayToConnection object to connect to a media element.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-iplaytocontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IPlayToControl extends IUnknown {
    /**
     * The interface identifier for IPlayToControl
     * @type {Guid}
     */
    static IID := Guid("{607574eb-f4b6-45c1-b08c-cb715122901d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPlayToControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Connect    : IntPtr
        Disconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPlayToControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Connects the media element to the media sharing engine.
     * @param {IMFSharingEngineClassFactory} pFactory A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/nn-mfsharingengine-imfsharingengineclassfactory">IMFSharingEngineClassFactory</a> interface. The media element uses this interface to create the Sharing Engine.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrol-connect
     */
    Connect(pFactory) {
        result := ComCall(3, this, "ptr", pFactory, "HRESULT")
        return result
    }

    /**
     * Disconnects the media element from the media sharing engine.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrol-disconnect
     */
    Disconnect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPlayToControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
    }
}
