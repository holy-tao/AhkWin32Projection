#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWRdsGraphicsChannel.ahk" { IWRdsGraphicsChannel }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WRdsGraphicsChannelType.ahk" { WRdsGraphicsChannelType }

/**
 * This interface is used by the RemoteFX graphics services API to create the graphics virtual channels necessary for remoting graphics data.
 * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsGraphicsChannelManager extends IUnknown {
    /**
     * The interface identifier for IWRdsGraphicsChannelManager
     * @type {Guid}
     */
    static IID := Guid("{0fd57159-e83e-476a-a8b9-4a7976e71e18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsGraphicsChannelManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsGraphicsChannelManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to create a graphics virtual channel.
     * @param {Pointer<Integer>} pszChannelName Type: <b>const char*</b>
     * @param {WRdsGraphicsChannelType} _channelType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype">WRdsGraphicsChannelType</a></b>
     * 
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype">WRdsGraphicsChannelType</a> enumeration that specifies what type of channel to create. If the specified type of channel cannot be created, this method should return a channel object rather than fail.
     * @returns {IWRdsGraphicsChannel} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel">IWRdsGraphicsChannel</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel">IWRdsGraphicsChannel</a> interface pointer that receives the channel object.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelmanager-createchannel
     */
    CreateChannel(pszChannelName, _channelType) {
        pszChannelNameMarshal := pszChannelName is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pszChannelNameMarshal, pszChannelName, WRdsGraphicsChannelType, _channelType, "ptr*", &ppVirtualChannel := 0, "HRESULT")
        return IWRdsGraphicsChannel(ppVirtualChannel)
    }

    Query(iid) {
        if (IWRdsGraphicsChannelManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateChannel := CallbackCreate(GetMethod(implObj, "CreateChannel"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateChannel)
    }
}
