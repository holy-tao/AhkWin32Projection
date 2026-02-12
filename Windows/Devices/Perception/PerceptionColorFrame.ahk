#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrame.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains a Windows.Media.VideoFrame with the color frame data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframe
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Windows.Media.VideoFrame with the color frame data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframe.videoframe
     * @type {VideoFrame} 
     */
    VideoFrame {
        get => this.get_VideoFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_VideoFrame() {
        if (!this.HasProp("__IPerceptionColorFrame")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrame := IPerceptionColorFrame(outPtr)
        }

        return this.__IPerceptionColorFrame.get_VideoFrame()
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
