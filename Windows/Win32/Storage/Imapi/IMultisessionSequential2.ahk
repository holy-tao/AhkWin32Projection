#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMultisessionSequential.ahk

/**
 * Use this interface to retrieve information about the size of a writeable unit on sequentially recorded media.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-imultisessionsequential2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMultisessionSequential2 extends IMultisessionSequential{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultisessionSequential2
     * @type {Guid}
     */
    static IID => Guid("{b507ca22-2204-11dd-966a-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WriteUnitSize"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential2-get_writeunitsize
     */
    get_WriteUnitSize() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
