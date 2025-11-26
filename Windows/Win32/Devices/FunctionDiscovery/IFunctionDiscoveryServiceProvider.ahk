#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented to create and initialize objects to provide a specified access interface to a resource represented by the function instance. After the object is created, the Initialize method is called to initialize the object.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryserviceprovider
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{4c81ed02-1b04-43f2-a451-69966cbcd1c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes an object that provides a specific interface that has been bound to the resource represented by the function instance.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface that represents the underlying resource.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object.
     * @returns {Pointer<Void>} The interface pointer requested in <i>riid</i>. Upon successful return, <i>*ppv</i> contains the requested interface pointer. Upon failure, <i>*ppv</i> contains <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryserviceprovider-initialize
     */
    Initialize(pIFunctionInstance, riid) {
        result := ComCall(3, this, "ptr", pIFunctionInstance, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
