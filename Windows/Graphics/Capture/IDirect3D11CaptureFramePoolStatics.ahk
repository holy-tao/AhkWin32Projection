#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Direct3D11CaptureFramePool.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IDirect3D11CaptureFramePoolStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D11CaptureFramePoolStatics
     * @type {Guid}
     */
    static IID => Guid("{7784056a-67aa-4d53-ae54-1088d5a8ca21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {IDirect3DDevice} device 
     * @param {Integer} pixelFormat 
     * @param {Integer} numberOfBuffers 
     * @param {SizeInt32} size_ 
     * @returns {Direct3D11CaptureFramePool} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(device, pixelFormat, numberOfBuffers, size_) {
        result := ComCall(6, this, "ptr", device, "int", pixelFormat, "int", numberOfBuffers, "ptr", size_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Direct3D11CaptureFramePool(result_)
    }
}
