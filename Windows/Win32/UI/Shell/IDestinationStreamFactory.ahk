#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method for manually copying a stream or file before applying changes to properties.
 * @remarks
 * 
  * The default copy-on-write behavior provided by <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> causes the entire source stream to be duplicated during a write operation. This can be costly for large streams, especially when a large portion of the stream is to be changed. <b>IDestinationStreamFactory</b> provides an alternative for the property handler author, who can use it manually to ensure that property changes do not corrupt the stream in case of failure. To do this, the author marks the handler as NoTransactedMode in the handler's CoClass registry key, and queries the stream for this interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idestinationstreamfactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDestinationStreamFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDestinationStreamFactory
     * @type {Guid}
     */
    static IID => Guid("{8a87781b-39a7-4a1f-aab3-a39b9c34a7d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDestinationStream"]

    /**
     * 
     * @param {Pointer<IStream>} ppstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idestinationstreamfactory-getdestinationstream
     */
    GetDestinationStream(ppstm) {
        result := ComCall(3, this, "ptr*", ppstm, "HRESULT")
        return result
    }
}
