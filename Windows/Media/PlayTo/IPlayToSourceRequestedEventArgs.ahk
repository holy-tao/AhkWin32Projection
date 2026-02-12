#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PlayToSourceRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToSourceRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToSourceRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c5cdc330-29df-4ec6-9da9-9fbdfcfc1b3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceRequest"]

    /**
     * @type {PlayToSourceRequest} 
     */
    SourceRequest {
        get => this.get_SourceRequest()
    }

    /**
     * 
     * @returns {PlayToSourceRequest} 
     */
    get_SourceRequest() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToSourceRequest(value)
    }
}
