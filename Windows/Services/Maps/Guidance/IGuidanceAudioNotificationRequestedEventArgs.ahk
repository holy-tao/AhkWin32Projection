#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceAudioNotificationRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceAudioNotificationRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ca2aa24a-c7c2-4d4c-9d7c-499576bceddb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioNotification", "get_AudioFilePaths", "get_AudioText"]

    /**
     * @type {Integer} 
     */
    AudioNotification {
        get => this.get_AudioNotification()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    AudioFilePaths {
        get => this.get_AudioFilePaths()
    }

    /**
     * @type {HSTRING} 
     */
    AudioText {
        get => this.get_AudioText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioNotification() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AudioFilePaths() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioText() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
