#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IControlInterface interface represents a control interface on a part (connector or subunit) in a device topology. The client obtains a reference to a part's IControlInterface interface by calling the IPart::GetControlInterface method.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-icontrolinterface
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IControlInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlInterface
     * @type {Guid}
     */
    static IID => Guid("{45d37c3f-5140-444a-ae24-400789f3cbf3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetIID"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-icontrolinterface-getname
     */
    GetName(ppwstrName) {
        result := ComCall(3, this, "ptr", ppwstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pIID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-icontrolinterface-getiid
     */
    GetIID(pIID) {
        result := ComCall(4, this, "ptr", pIID, "HRESULT")
        return result
    }
}
