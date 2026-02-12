#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class IInstalledVoicesStatic2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstalledVoicesStatic2
     * @type {Guid}
     */
    static IID => Guid("{64255f2e-358d-4058-be9a-fd3fcb423530}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrySetDefaultVoiceAsync"]

    /**
     * 
     * @param {VoiceInformation} voice 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetDefaultVoiceAsync(voice) {
        result := ComCall(6, this, "ptr", voice, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
