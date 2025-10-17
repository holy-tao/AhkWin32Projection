#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class SettingsManagementInfrastructure {

;@region Constants

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_NAME => "name"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_VERSION => "version"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_LANGUAGE => "language"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_ARCHITECTURE => "architecture"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_TOKEN => "token"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_URI => "uri"

    /**
     * @type {String}
     */
    static WCM_SETTINGS_ID_VERSION_SCOPE => "versionScope"

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_SETTINGS_ID_FLAG_REFERENCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_SETTINGS_ID_FLAG_DEFINITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINK_STORE_TO_ENGINE_INSTANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIMITED_VALIDATION_MODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INTERNALERROR => -2145255424

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_STATENODENOTFOUND => -2145255423

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_STATENODENOTALLOWED => -2145255422

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_ATTRIBUTENOTFOUND => -2145255421

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_ATTRIBUTENOTALLOWED => -2145255420

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDVALUE => -2145255419

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDVALUEFORMAT => -2145255418

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_TYPENOTSPECIFIED => -2145255417

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDDATATYPE => -2145255416

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_NOTPOSITIONED => -2145255415

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_READONLYITEM => -2145255414

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDPATH => -2145255413

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_WRONGESCAPESTRING => -2145255412

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDVERSIONFORMAT => -2145255411

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDLANGUAGEFORMAT => -2145255410

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_KEYNOTCHANGEABLE => -2145255409

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_EXPRESSIONNOTFOUND => -2145255408

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_SUBSTITUTIONNOTFOUND => -2145255407

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_USERALREADYREGISTERED => -2145255406

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_USERNOTFOUND => -2145255405

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_NAMESPACENOTFOUND => -2145255404

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_NAMESPACEALREADYREGISTERED => -2145255403

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_STORECORRUPTED => -2145255402

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDEXPRESSIONSYNTAX => -2145255401

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_NOTIFICATIONNOTFOUND => -2145255400

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_CONFLICTINGASSERTION => -2145255399

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_ASSERTIONFAILED => -2145255398

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_DUPLICATENAME => -2145255397

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDKEY => -2145255396

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDSTREAM => -2145255395

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_HANDLERNOTFOUND => -2145255394

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDHANDLERSYNTAX => -2145255393

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_VALIDATIONFAILED => -2145255392

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_RESTRICTIONFAILED => -2145255391

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_MANIFESTCOMPILATIONFAILED => -2145255390

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_CYCLICREFERENCE => -2145255389

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_MIXTYPEASSERTION => -2145255388

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_NOTSUPPORTEDFUNCTION => -2145255387

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_VALUETOOBIG => -2145255386

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDATTRIBUTECOMBINATION => -2145255385

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_ABORTOPERATION => -2145255384

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_MISSINGCONFIGURATION => -2145255383

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_INVALIDPROCESSORFORMAT => -2145255382

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_SOURCEMANEMPTYVALUE => -2145255381

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_INTERNALERROR => 2232320

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_ATTRIBUTENOTFOUND => 2232321

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_LEGACYSETTINGWARNING => 2232322

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_INVALIDATTRIBUTECOMBINATION => 2232324

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_ATTRIBUTENOTALLOWED => 2232325

    /**
     * @type {Integer (Int32)}
     */
    static WCM_S_NAMESPACENOTFOUND => 2232326

    /**
     * @type {Integer (Int32)}
     */
    static WCM_E_UNKNOWNRESULT => -2145251325
;@endregion Constants

;@region Methods
;@endregion Methods
}
