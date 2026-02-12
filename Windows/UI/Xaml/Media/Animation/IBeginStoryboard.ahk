#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\Storyboard.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IBeginStoryboard extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBeginStoryboard
     * @type {Guid}
     */
    static IID => Guid("{64189fcd-49ec-4e52-a6f6-55324c921053}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Storyboard", "put_Storyboard"]

    /**
     * @type {Storyboard} 
     */
    Storyboard {
        get => this.get_Storyboard()
        set => this.put_Storyboard(value)
    }

    /**
     * 
     * @returns {Storyboard} 
     */
    get_Storyboard() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Storyboard(value)
    }

    /**
     * 
     * @param {Storyboard} value 
     * @returns {HRESULT} 
     */
    put_Storyboard(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
