#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\VpnPacketBuffer.ahk
#Include .\IVpnPacketBufferList.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to manage **VpnPacketBuffer** objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnPacketBufferList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnPacketBufferList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnPacketBufferList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of **VpnPacketBuffer**. The status property may be used to report errors when manipulating the **IVpnPacketBufferList.**
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets the number of **IVpnPacketBuffer** objects in the **IVpnPacketBufferList** object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Add a new **IVpnPacketBuffer** object to the end of the **IVpnPacketBufferList**.
     * @param {VpnPacketBuffer} nextVpnPacketBuffer The new **IVpnPacketBuffer** object to add to the **IVpnPacketBufferList** object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.append
     */
    Append(nextVpnPacketBuffer) {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.Append(nextVpnPacketBuffer)
    }

    /**
     * Add a new **IVpnPacketBuffer** object to the start of the **IVpnPacketBufferList**.
     * @param {VpnPacketBuffer} nextVpnPacketBuffer The new **IVpnPacketBuffer** object to add to the **IVpnPacketBufferList** object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.addatbegin
     */
    AddAtBegin(nextVpnPacketBuffer) {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.AddAtBegin(nextVpnPacketBuffer)
    }

    /**
     * Remove the **IVpnPacketBuffer** object at the end of the **IVpnPacketBufferList**.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.RemoveAtEnd()
    }

    /**
     * Remove the **IVpnPacketBuffer** object at the start of the **IVpnPacketBufferList**.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.removeatbegin
     */
    RemoveAtBegin() {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.RemoveAtBegin()
    }

    /**
     * Removes all the **IVpnPacketBuffer** objects from a **IVpnPacketBufferList**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.clear
     */
    Clear() {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.Clear()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.put_Status(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVpnPacketBufferList")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBufferList := IVpnPacketBufferList(outPtr)
        }

        return this.__IVpnPacketBufferList.get_Size()
    }

    /**
     * Provides access to the First parameter. This SDK programming element is introduced in Windows PowerShell 3.0.
     * @remarks
     * <!--Begin NET note for IEnumerable support-->
     * You can iterate through a [VpnPacketBufferList](vpnpacketbufferlist.md) in C# or Microsoft Visual Basic. In many cases, such as using **foreach** syntax, the compiler does this casting for you and you won't need to cast to `IEnumerable<VpnPacketBuffer>` explicitly. If you do need to cast explicitly, for example if you want to call [GetEnumerator](/dotnet/api/system.collections.ienumerable.getenumerator?view=dotnet-uwp-10.0&preserve-view=true), cast to [IEnumerable<T>](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) with a [VpnPacketBuffer](vpnpacketbuffer.md) constraint.
     * 
     * 
     * <!--End NET note for IEnumerable support-->
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferlist.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{fa954f6e-30d7-50e0-9d43-dadb6c53e196}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(VpnPacketBuffer, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
