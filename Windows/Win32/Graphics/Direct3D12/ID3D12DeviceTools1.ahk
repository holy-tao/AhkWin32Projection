#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Direct3D\ID3DBlob.ahk
#Include .\ID3D12DeviceTools.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceTools1 extends ID3D12DeviceTools{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceTools1
     * @type {Guid}
     */
    static IID => Guid("{e30e9fc7-e641-4d6e-8a81-9dd9206ec47a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationSpecificDriverState", "GetApplicationSpecificDriverBlobStatus"]

    /**
     * 
     * @returns {ID3DBlob} 
     */
    GetApplicationSpecificDriverState() {
        result := ComCall(4, this, "ptr*", &ppBlob := 0, "HRESULT")
        return ID3DBlob(ppBlob)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetApplicationSpecificDriverBlobStatus() {
        result := ComCall(5, this, "int")
        return result
    }
}
