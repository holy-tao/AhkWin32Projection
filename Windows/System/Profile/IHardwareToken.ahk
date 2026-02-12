#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IHardwareToken extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHardwareToken
     * @type {Guid}
     */
    static IID => Guid("{28f6d4c0-fb12-40a4-8167-7f4e03d2724c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Signature", "get_Certificate"]

    /**
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IBuffer} 
     */
    Signature {
        get => this.get_Signature()
    }

    /**
     * @type {IBuffer} 
     */
    Certificate {
        get => this.get_Certificate()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Signature() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Certificate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
