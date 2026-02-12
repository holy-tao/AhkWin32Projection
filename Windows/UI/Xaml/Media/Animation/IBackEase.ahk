#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IBackEase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackEase
     * @type {Guid}
     */
    static IID => Guid("{e47796e7-f805-4a8f-81c9-38e6472caa94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Amplitude", "put_Amplitude"]

    /**
     * @type {Float} 
     */
    Amplitude {
        get => this.get_Amplitude()
        set => this.put_Amplitude(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Amplitude() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Amplitude(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
