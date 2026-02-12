#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VisualElementsRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class IVisualElementsRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualElementsRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7b6fc982-3a0d-4ece-af96-cd17e1b00b2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request"]

    /**
     * @type {VisualElementsRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {VisualElementsRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualElementsRequest(value)
    }
}
