#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\MediaFrameSourceGroup.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSourceGroupStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSourceGroupStatics
     * @type {Guid}
     */
    static IID => Guid("{1c48bfc5-436f-4508-94cf-d5d8b7326445}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllAsync", "FromIdAsync", "GetDeviceSelector"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<MediaFrameSourceGroup>>} 
     */
    FindAllAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, MediaFrameSourceGroup), value)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<MediaFrameSourceGroup>} 
     */
    FromIdAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameSourceGroup, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
