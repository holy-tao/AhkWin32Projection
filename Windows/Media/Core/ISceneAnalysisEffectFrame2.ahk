#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ISceneAnalysisEffectFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneAnalysisEffectFrame2
     * @type {Guid}
     */
    static IID => Guid("{2d4e29be-061f-47ae-9915-02524b5f9a5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnalysisRecommendation"]

    /**
     * @type {Integer} 
     */
    AnalysisRecommendation {
        get => this.get_AnalysisRecommendation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AnalysisRecommendation() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
