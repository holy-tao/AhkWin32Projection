#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyITADataGenerator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyITADataGenerator
     * @type {Guid}
     */
    static IID => Guid("{24446b8e-10b9-4530-b25b-901a8029a9b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateData"]

    /**
     * 
     * @param {Guid} guidCPSystemId 
     * @param {Integer} countOfStreams 
     * @param {IPropertySet} configuration 
     * @param {Integer} format 
     * @param {Pointer<Pointer>} dataBytes 
     * @returns {HRESULT} 
     */
    GenerateData(guidCPSystemId, countOfStreams, configuration, format, dataBytes) {
        result := ComCall(6, this, "ptr", guidCPSystemId, "uint", countOfStreams, "ptr", configuration, "int", format, "ptr", dataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
