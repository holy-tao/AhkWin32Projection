#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Workplace
 * @version WindowsRuntime 1.4
 */
class IMdmPolicyStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMdmPolicyStatics2
     * @type {Guid}
     */
    static IID => Guid("{c99c7526-03d4-49f9-a993-43efccd265c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMessagingSyncPolicy"]

    /**
     * 
     * @returns {Integer} 
     */
    GetMessagingSyncPolicy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
