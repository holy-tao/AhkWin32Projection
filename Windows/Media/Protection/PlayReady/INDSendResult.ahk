#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the result, in the form of a response message, from the PlayReady-ND messenger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indsendresult
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDSendResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDSendResult
     * @type {Guid}
     */
    static IID => Guid("{e3685517-a584-479d-90b7-d689c7bf7c80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Response"]

    /**
     * Gets the response message from a messenger.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indsendresult.response
     */
    Response {
        get => this.get_Response()
    }

    /**
     * 
     * @param {Pointer<Pointer>} responseDataBytes 
     * @returns {HRESULT} 
     */
    get_Response(responseDataBytes) {
        result := ComCall(6, this, "ptr", responseDataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
