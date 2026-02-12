#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Capture\CapturedFrameControlValues.ahk
#Include .\HighDynamicRangeOutput.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ISceneAnalysisEffectFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneAnalysisEffectFrame
     * @type {Guid}
     */
    static IID => Guid("{d8b10e4c-7fd9-42e1-85eb-6572c297c987}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameControlValues", "get_HighDynamicRange"]

    /**
     * @type {CapturedFrameControlValues} 
     */
    FrameControlValues {
        get => this.get_FrameControlValues()
    }

    /**
     * @type {HighDynamicRangeOutput} 
     */
    HighDynamicRange {
        get => this.get_HighDynamicRange()
    }

    /**
     * 
     * @returns {CapturedFrameControlValues} 
     */
    get_FrameControlValues() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrameControlValues(value)
    }

    /**
     * 
     * @returns {HighDynamicRangeOutput} 
     */
    get_HighDynamicRange() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HighDynamicRangeOutput(value)
    }
}
