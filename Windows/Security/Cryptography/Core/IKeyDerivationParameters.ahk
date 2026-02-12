#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationParameters
     * @type {Guid}
     */
    static IID => Guid("{7bf05967-047b-4a8c-964a-469ffd5522e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KdfGenericBinary", "put_KdfGenericBinary", "get_IterationCount"]

    /**
     * @type {IBuffer} 
     */
    KdfGenericBinary {
        get => this.get_KdfGenericBinary()
        set => this.put_KdfGenericBinary(value)
    }

    /**
     * @type {Integer} 
     */
    IterationCount {
        get => this.get_IterationCount()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_KdfGenericBinary() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_KdfGenericBinary(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IterationCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
