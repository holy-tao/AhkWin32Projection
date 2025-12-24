#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Extends the IInkTablet interface.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinktablet2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablet2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkTablet2
     * @type {Guid}
     */
    static IID => Guid("{90c91ad2-fa36-49d6-9516-ce8d570f6f85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceKind"]

    /**
     * @type {Integer} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * Gets the type of Tablet device being used.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet2-get_devicekind
     */
    get_DeviceKind() {
        result := ComCall(7, this, "int*", &Kind := 0, "HRESULT")
        return Kind
    }
}
