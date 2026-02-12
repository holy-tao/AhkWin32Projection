#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NDLicenseFetchDescriptor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDLicenseFetchDescriptorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDLicenseFetchDescriptorFactory
     * @type {Guid}
     */
    static IID => Guid("{d0031202-cfac-4f00-ae6a-97af80b848f2}")

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
     * @param {Integer} contentIDType 
     * @param {Integer} contentIDBytes_length 
     * @param {Pointer<Integer>} contentIDBytes 
     * @param {INDCustomData} licenseFetchChallengeCustomData 
     * @returns {NDLicenseFetchDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(contentIDType, contentIDBytes_length, contentIDBytes, licenseFetchChallengeCustomData) {
        contentIDBytesMarshal := contentIDBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int", contentIDType, "uint", contentIDBytes_length, contentIDBytesMarshal, contentIDBytes, "ptr", licenseFetchChallengeCustomData, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDLicenseFetchDescriptor(instance)
    }
}
