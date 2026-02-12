#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include .\BarcodeScannerVideoFrame.ahk
#Include .\BarcodeScannerProviderConnection.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerFrameReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerFrameReader
     * @type {Guid}
     */
    static IID => Guid("{dbc72b07-64c3-482b-93c8-65fb33c22208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAsync", "StopAsync", "TryAcquireLatestFrameAsync", "get_Connection", "add_FrameArrived", "remove_FrameArrived"]

    /**
     * @type {BarcodeScannerProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    StartAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StopAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<BarcodeScannerVideoFrame>} 
     */
    TryAcquireLatestFrameAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BarcodeScannerVideoFrame, operation)
    }

    /**
     * 
     * @returns {BarcodeScannerProviderConnection} 
     */
    get_Connection() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeScannerProviderConnection(value)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerFrameReader, BarcodeScannerFrameReaderFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
