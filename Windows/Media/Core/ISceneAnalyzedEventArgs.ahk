#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SceneAnalysisEffectFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ISceneAnalyzedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneAnalyzedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{146b9588-2851-45e4-ad55-44cf8df8db4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResultFrame"]

    /**
     * @type {SceneAnalysisEffectFrame} 
     */
    ResultFrame {
        get => this.get_ResultFrame()
    }

    /**
     * 
     * @returns {SceneAnalysisEffectFrame} 
     */
    get_ResultFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneAnalysisEffectFrame(value)
    }
}
