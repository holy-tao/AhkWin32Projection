#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentAvailabilityChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentAvailabilityChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e0f59d26-5927-4450-965c-1ceb7becde65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral"]

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}
