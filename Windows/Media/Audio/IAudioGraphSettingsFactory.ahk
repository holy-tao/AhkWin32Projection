#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioGraphSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraphSettingsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraphSettingsFactory
     * @type {Guid}
     */
    static IID => Guid("{a5d91cc6-c2eb-4a61-a214-1d66d75f83da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} audioRenderCategory_ 
     * @returns {AudioGraphSettings} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(audioRenderCategory_) {
        result := ComCall(6, this, "int", audioRenderCategory_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioGraphSettings(value)
    }
}
