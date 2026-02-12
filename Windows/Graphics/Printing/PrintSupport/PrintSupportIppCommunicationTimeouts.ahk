#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportIppCommunicationTimeouts.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the timeout intervals for Internet Printing Protocol (IPP) communications.
 * @remarks
 * This class is used by properties of the [PrintSupportIppCommunicationConfiguration](printsupportippcommunicationconfiguration.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationtimeouts
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportIppCommunicationTimeouts extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportIppCommunicationTimeouts

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportIppCommunicationTimeouts.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the timeout for establishing the IPP connection.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationtimeouts.connecttimeout
     * @type {TimeSpan} 
     */
    ConnectTimeout {
        get => this.get_ConnectTimeout()
        set => this.put_ConnectTimeout(value)
    }

    /**
     * Gets or sets the timeout for sending IPP requests.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationtimeouts.sendtimeout
     * @type {TimeSpan} 
     */
    SendTimeout {
        get => this.get_SendTimeout()
        set => this.put_SendTimeout(value)
    }

    /**
     * Gets or sets the timeout for receiving IPP responses.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationtimeouts.receivetimeout
     * @type {TimeSpan} 
     */
    ReceiveTimeout {
        get => this.get_ReceiveTimeout()
        set => this.put_ReceiveTimeout(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ConnectTimeout() {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.get_ConnectTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_ConnectTimeout(value) {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.put_ConnectTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SendTimeout() {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.get_SendTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_SendTimeout(value) {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.put_SendTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ReceiveTimeout() {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.get_ReceiveTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_ReceiveTimeout(value) {
        if (!this.HasProp("__IPrintSupportIppCommunicationTimeouts")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationTimeouts := IPrintSupportIppCommunicationTimeouts(outPtr)
        }

        return this.__IPrintSupportIppCommunicationTimeouts.put_ReceiveTimeout(value)
    }

;@endregion Instance Methods
}
