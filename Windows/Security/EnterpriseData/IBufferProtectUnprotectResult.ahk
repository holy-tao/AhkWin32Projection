#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\DataProtectionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IBufferProtectUnprotectResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBufferProtectUnprotectResult
     * @type {Guid}
     */
    static IID => Guid("{47995edc-6cec-4e3a-b251-9e7485d79e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Buffer", "get_ProtectionInfo"]

    /**
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * @type {DataProtectionInfo} 
     */
    ProtectionInfo {
        get => this.get_ProtectionInfo()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Buffer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {DataProtectionInfo} 
     */
    get_ProtectionInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataProtectionInfo(value)
    }
}
