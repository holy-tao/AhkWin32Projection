#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectMusicPort.ahk" { IDirectMusicPort }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicThru extends IUnknown {
    /**
     * The interface identifier for IDirectMusicThru
     * @type {Guid}
     */
    static IID := Guid("{ced153e7-3606-11d2-b9f9-0000f875ac12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicThru interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ThruChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicThru.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSourceChannelGroup 
     * @param {Integer} dwSourceChannel 
     * @param {Integer} dwDestinationChannelGroup 
     * @param {Integer} dwDestinationChannel 
     * @param {IDirectMusicPort} pDestinationPort 
     * @returns {HRESULT} 
     */
    ThruChannel(dwSourceChannelGroup, dwSourceChannel, dwDestinationChannelGroup, dwDestinationChannel, pDestinationPort) {
        result := ComCall(3, this, "uint", dwSourceChannelGroup, "uint", dwSourceChannel, "uint", dwDestinationChannelGroup, "uint", dwDestinationChannel, "ptr", pDestinationPort, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicThru.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThruChannel := CallbackCreate(GetMethod(implObj, "ThruChannel"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThruChannel)
    }
}
