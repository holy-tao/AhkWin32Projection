#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\DisplayAdapterId.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplaySource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplaySource
     * @type {Guid}
     */
    static IID => Guid("{ecd15fc1-eadc-51bc-971d-3bc628db2dd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdapterId", "get_SourceId", "GetMetadata"]

    /**
     * @type {DisplayAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * @type {Integer} 
     */
    SourceId {
        get => this.get_SourceId()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_AdapterId() {
        value := DisplayAdapterId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} Key 
     * @returns {IBuffer} 
     */
    GetMetadata(Key) {
        result := ComCall(8, this, "ptr", Key, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }
}
