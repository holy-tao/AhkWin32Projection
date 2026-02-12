#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HighDynamicRangeControl.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ISceneAnalysisEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneAnalysisEffect
     * @type {Guid}
     */
    static IID => Guid("{c04ba319-ca41-4813-bffd-7b08b0ed2557}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HighDynamicRangeAnalyzer", "put_DesiredAnalysisInterval", "get_DesiredAnalysisInterval", "add_SceneAnalyzed", "remove_SceneAnalyzed"]

    /**
     * @type {HighDynamicRangeControl} 
     */
    HighDynamicRangeAnalyzer {
        get => this.get_HighDynamicRangeAnalyzer()
    }

    /**
     * @type {TimeSpan} 
     */
    DesiredAnalysisInterval {
        get => this.get_DesiredAnalysisInterval()
        set => this.put_DesiredAnalysisInterval(value)
    }

    /**
     * 
     * @returns {HighDynamicRangeControl} 
     */
    get_HighDynamicRangeAnalyzer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HighDynamicRangeControl(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredAnalysisInterval(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredAnalysisInterval() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<SceneAnalysisEffect, SceneAnalyzedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SceneAnalyzed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SceneAnalyzed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(10, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
