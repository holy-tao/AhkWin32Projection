#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CompositionDebugSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ICompositionDebugSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDebugSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{64ec1f1e-6af8-4af8-b814-c870fd5a9505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetSettings"]

    /**
     * 
     * @param {Compositor} compositor_ 
     * @returns {CompositionDebugSettings} 
     */
    TryGetSettings(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionDebugSettings(result_)
    }
}
