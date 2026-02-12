#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverVideoStreamSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object which describes settings for the video stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivervideostreamsettings
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverVideoStreamSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverVideoStreamSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverVideoStreamSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the width and height of the video stream, in pixels.
     * @remarks
     * This is the size of the video stream as encoded by the Miracast transmitters. The property does not account for any scaling of the video display window that may be done by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivervideostreamsettings.size
     * @type {SizeInt32} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Specifies the bit rate, in bits per second, of the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivervideostreamsettings.bitrate
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
        set => this.put_Bitrate(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_Size() {
        if (!this.HasProp("__IMiracastReceiverVideoStreamSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverVideoStreamSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverVideoStreamSettings := IMiracastReceiverVideoStreamSettings(outPtr)
        }

        return this.__IMiracastReceiverVideoStreamSettings.get_Size()
    }

    /**
     * 
     * @param {SizeInt32} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IMiracastReceiverVideoStreamSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverVideoStreamSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverVideoStreamSettings := IMiracastReceiverVideoStreamSettings(outPtr)
        }

        return this.__IMiracastReceiverVideoStreamSettings.put_Size(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IMiracastReceiverVideoStreamSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverVideoStreamSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverVideoStreamSettings := IMiracastReceiverVideoStreamSettings(outPtr)
        }

        return this.__IMiracastReceiverVideoStreamSettings.get_Bitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bitrate(value) {
        if (!this.HasProp("__IMiracastReceiverVideoStreamSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverVideoStreamSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverVideoStreamSettings := IMiracastReceiverVideoStreamSettings(outPtr)
        }

        return this.__IMiracastReceiverVideoStreamSettings.put_Bitrate(value)
    }

;@endregion Instance Methods
}
