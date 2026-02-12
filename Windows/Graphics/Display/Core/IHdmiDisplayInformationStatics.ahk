#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HdmiDisplayInformation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class IHdmiDisplayInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHdmiDisplayInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{6ce6b260-f42a-4a15-914c-7b8e2a5a65df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {HdmiDisplayInformation} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HdmiDisplayInformation(result_)
    }
}
