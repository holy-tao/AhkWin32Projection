#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines an interface implemented by a audio or video stream descriptor.
 * @remarks
 * [AudioStreamDescriptor](audiostreamdescriptor.md), [VideoStreamDescriptor](videostreamdescriptor.md)
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor2
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamDescriptor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamDescriptor2
     * @type {Guid}
     */
    static IID => Guid("{5073010f-e8b2-4071-b00b-ebf337a76b58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Label", "get_Label"]

    /**
     * Gets or sets an app-defined label that identifies a stream in a [MediaEncodingProfile](/uwp/api/Windows.Media.MediaProperties.MediaEncodingProfile) that contains multiple streams.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediastreamdescriptor2.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
