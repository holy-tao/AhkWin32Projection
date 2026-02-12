#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IReference.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IPropertySet.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a single frame of media data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{bfb52f8c-5943-47d8-8e10-05308aa5fbd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_IsReadOnly", "put_RelativeTime", "get_RelativeTime", "put_SystemRelativeTime", "get_SystemRelativeTime", "put_Duration", "get_Duration", "put_IsDiscontinuous", "get_IsDiscontinuous", "get_ExtendedProperties"]

    /**
     * Gets a string indicating the type of data the media frame contains.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating whether the audio frame is read-only.
     * @remarks
     * When this value is true, both the data payload and the mutable properties of the media frame are read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the relative time of the frame within the media stream.
     * @remarks
     * Use [SystemRelativeTime](imediaframe_systemrelativetime.md) to get a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.relativetime
     * @type {IReference<TimeSpan>} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets or sets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @remarks
     * Use [RelativeTime](imediaframe_relativetime.md) to get a timestamp that is relative to the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
        set => this.put_SystemRelativeTime(value)
    }

    /**
     * Gets or sets the duration of the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates whether an media frame is the first frame after a gap in the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.isdiscontinuous
     * @type {Boolean} 
     */
    IsDiscontinuous {
        get => this.get_IsDiscontinuous()
        set => this.put_IsDiscontinuous(value)
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaframe.extendedproperties
     * @type {IPropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_RelativeTime() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SystemRelativeTime(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscontinuous(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscontinuous() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ExtendedProperties() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}
