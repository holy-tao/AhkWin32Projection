#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IEncryptedAndAuthenticatedData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEncryptedAndAuthenticatedData
     * @type {Guid}
     */
    static IID => Guid("{6fa42fe7-1ecb-4b00-bea5-60b83f862f17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncryptedData", "get_AuthenticationTag"]

    /**
     * @type {IBuffer} 
     */
    EncryptedData {
        get => this.get_EncryptedData()
    }

    /**
     * @type {IBuffer} 
     */
    AuthenticationTag {
        get => this.get_AuthenticationTag()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_EncryptedData() {
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
    get_AuthenticationTag() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
