#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfLatticeElements.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLMLattice interface is implemented by the speech text service to provide information about lattice element properties and is used by a client (application or other text service).
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itflmlattice
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLMLattice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLMLattice
     * @type {Guid}
     */
    static IID => Guid("{d4236675-a5bf-4570-9d42-5d6d7b02d59b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryType", "EnumLatticeElements"]

    /**
     * 
     * @param {Pointer<Guid>} rguidType 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itflmlattice-querytype
     */
    QueryType(rguidType) {
        result := ComCall(3, this, "ptr", rguidType, "int*", &pfSupported := 0, "HRESULT")
        return pfSupported
    }

    /**
     * 
     * @param {Integer} dwFrameStart 
     * @param {Pointer<Guid>} rguidType 
     * @returns {IEnumTfLatticeElements} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itflmlattice-enumlatticeelements
     */
    EnumLatticeElements(dwFrameStart, rguidType) {
        result := ComCall(4, this, "uint", dwFrameStart, "ptr", rguidType, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLatticeElements(ppEnum)
    }
}
