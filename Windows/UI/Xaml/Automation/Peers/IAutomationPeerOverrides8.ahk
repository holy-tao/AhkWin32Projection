#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeerOverrides8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeerOverrides8
     * @type {Guid}
     */
    static IID => Guid("{0e1ebbd4-a003-4936-8175-f5457c07f0c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHeadingLevelCore"]

    /**
     * 
     * @returns {Integer} 
     */
    GetHeadingLevelCore() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
