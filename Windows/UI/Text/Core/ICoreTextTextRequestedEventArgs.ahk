#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreTextTextRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextTextRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextTextRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f096a2d0-41c6-4c02-8b1a-d953b00cabb3}")

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
     * @type {CoreTextTextRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {CoreTextTextRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreTextTextRequest(value)
    }
}
