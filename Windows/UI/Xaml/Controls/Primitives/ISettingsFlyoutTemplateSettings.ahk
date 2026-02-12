#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\Media\ImageSource.ahk
#Include ..\..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISettingsFlyoutTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsFlyoutTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{bcf14c10-cea7-43f1-9d68-57605ded69d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderBackground", "get_HeaderForeground", "get_BorderBrush", "get_BorderThickness", "get_IconSource", "get_ContentTransitions"]

    /**
     * @type {Brush} 
     */
    HeaderBackground {
        get => this.get_HeaderBackground()
    }

    /**
     * @type {Brush} 
     */
    HeaderForeground {
        get => this.get_HeaderForeground()
    }

    /**
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
    }

    /**
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
    }

    /**
     * @type {ImageSource} 
     */
    IconSource {
        get => this.get_IconSource()
    }

    /**
     * @type {TransitionCollection} 
     */
    ContentTransitions {
        get => this.get_ContentTransitions()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderBackground() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderForeground() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        value := Thickness()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_IconSource() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ContentTransitions() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }
}
