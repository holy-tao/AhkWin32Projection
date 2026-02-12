#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFrame.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a frame of data from the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframe
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Relative Time of this frame relative to other frames from this IPerceptionFrameProvider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframe.relativetime
     * @type {TimeSpan} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets the Properties for this frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframe.properties
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * The actual bytes of the frame which can be consumed as described by the Properties of the IPerceptionFrameProvider which produced the frame.
     * @remarks
     * To write to these bytes, one can use Windows::Foundation::IMemoryBuffer::CreateReference() to create a Windows::Foundation::IMemoryBufferReference. That can then be converted to a Windows::Foundation::IMemoryBufferByteAccess and call GetBuffer() on that to get to the raw byte buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframe.framedata
     * @type {IMemoryBuffer} 
     */
    FrameData {
        get => this.get_FrameData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTime() {
        if (!this.HasProp("__IPerceptionFrame")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrame := IPerceptionFrame(outPtr)
        }

        return this.__IPerceptionFrame.get_RelativeTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        if (!this.HasProp("__IPerceptionFrame")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrame := IPerceptionFrame(outPtr)
        }

        return this.__IPerceptionFrame.put_RelativeTime(value)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPerceptionFrame")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrame := IPerceptionFrame(outPtr)
        }

        return this.__IPerceptionFrame.get_Properties()
    }

    /**
     * 
     * @returns {IMemoryBuffer} 
     */
    get_FrameData() {
        if (!this.HasProp("__IPerceptionFrame")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrame := IPerceptionFrame(outPtr)
        }

        return this.__IPerceptionFrame.get_FrameData()
    }

;@endregion Instance Methods
}
