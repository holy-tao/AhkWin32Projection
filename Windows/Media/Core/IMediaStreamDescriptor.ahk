#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines an interface implemented by a audio or video stream descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamDescriptor
     * @type {Guid}
     */
    static IID => Guid("{80f16e6e-92f7-451e-97d2-afd80742da70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelected", "put_Name", "get_Name", "put_Language", "get_Language"]

    /**
     * Specifies whether the stream is currently in use by the [MediaStreamSource](mediastreamsource.md).
     * @remarks
     * IsSelected is **true** if the stream represented by the stream descriptor is currently selected by the media pipeline. For example, if it is currently in use by the [MediaStreamSource](mediastreamsource.md). Otherwise, the value is **false**.
     * 
     * The [MediaStreamSource](mediastreamsource.md) only raises the [SampleRequested](mediastreamsource_samplerequested.md) event for streams which are selected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets or sets the name of the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The name is a free-form human readable string that describes the stream, for example, “English soundtrack”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the RFC-1766 language code for the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The language is specified using a RFC-1766 language code, for example, “en-US”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        result := ComCall(6, this, "int*", &selected := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selected
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
