#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NDCustomData.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDCustomDataFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDCustomDataFactory
     * @type {Guid}
     */
    static IID => Guid("{d65405ab-3424-4833-8c9a-af5fdeb22872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} customDataTypeIDBytes_length 
     * @param {Pointer<Integer>} customDataTypeIDBytes 
     * @param {Integer} customDataBytes_length 
     * @param {Pointer<Integer>} customDataBytes 
     * @returns {NDCustomData} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(customDataTypeIDBytes_length, customDataTypeIDBytes, customDataBytes_length, customDataBytes) {
        customDataTypeIDBytesMarshal := customDataTypeIDBytes is VarRef ? "char*" : "ptr"
        customDataBytesMarshal := customDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", customDataTypeIDBytes_length, customDataTypeIDBytesMarshal, customDataTypeIDBytes, "uint", customDataBytes_length, customDataBytesMarshal, customDataBytes, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDCustomData(instance)
    }
}
