#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlError extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MX_E_MX => -1072894464

    /**
     * @type {Integer (Int32)}
     */
    static MX_E_INPUTEND => -1072894463

    /**
     * @type {Integer (Int32)}
     */
    static MX_E_ENCODING => -1072894462

    /**
     * @type {Integer (Int32)}
     */
    static MX_E_ENCODINGSWITCH => -1072894461

    /**
     * @type {Integer (Int32)}
     */
    static MX_E_ENCODINGSIGNATURE => -1072894460

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_WC => -1072894432

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_WHITESPACE => -1072894431

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_SEMICOLON => -1072894430

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_GREATERTHAN => -1072894429

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_QUOTE => -1072894428

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_EQUAL => -1072894427

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_LESSTHAN => -1072894426

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_HEXDIGIT => -1072894425

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DIGIT => -1072894424

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_LEFTBRACKET => -1072894423

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_LEFTPAREN => -1072894422

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_XMLCHARACTER => -1072894421

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_NAMECHARACTER => -1072894420

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_SYNTAX => -1072894419

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_CDSECT => -1072894418

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_COMMENT => -1072894417

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_CONDSECT => -1072894416

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DECLATTLIST => -1072894415

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DECLDOCTYPE => -1072894414

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DECLELEMENT => -1072894413

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DECLENTITY => -1072894412

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DECLNOTATION => -1072894411

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_NDATA => -1072894410

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PUBLIC => -1072894409

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_SYSTEM => -1072894408

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_NAME => -1072894407

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_ROOTELEMENT => -1072894406

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_ELEMENTMATCH => -1072894405

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_UNIQUEATTRIBUTE => -1072894404

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_TEXTXMLDECL => -1072894403

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_LEADINGXML => -1072894402

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_TEXTDECL => -1072894401

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_XMLDECL => -1072894400

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_ENCNAME => -1072894399

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PUBLICID => -1072894398

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PESINTERNALSUBSET => -1072894397

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PESBETWEENDECLS => -1072894396

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_NORECURSION => -1072894395

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_ENTITYCONTENT => -1072894394

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_UNDECLAREDENTITY => -1072894393

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PARSEDENTITY => -1072894392

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_NOEXTERNALENTITYREF => -1072894391

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_PI => -1072894390

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_SYSTEMID => -1072894389

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_QUESTIONMARK => -1072894388

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_CDSECTEND => -1072894387

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_MOREDATA => -1072894386

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_DTDPROHIBITED => -1072894385

    /**
     * @type {Integer (Int32)}
     */
    static WC_E_INVALIDXMLSPACE => -1072894384

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_NC => -1072894368

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_QNAMECHARACTER => -1072894367

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_QNAMECOLON => -1072894366

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_NAMECOLON => -1072894365

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_DECLAREDPREFIX => -1072894364

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_UNDECLAREDPREFIX => -1072894363

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_EMPTYURI => -1072894362

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_XMLPREFIXRESERVED => -1072894361

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_XMLNSPREFIXRESERVED => -1072894360

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_XMLURIRESERVED => -1072894359

    /**
     * @type {Integer (Int32)}
     */
    static NC_E_XMLNSURIRESERVED => -1072894358

    /**
     * @type {Integer (Int32)}
     */
    static SC_E_SC => -1072894336

    /**
     * @type {Integer (Int32)}
     */
    static SC_E_MAXELEMENTDEPTH => -1072894335

    /**
     * @type {Integer (Int32)}
     */
    static SC_E_MAXENTITYEXPANSION => -1072894334

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_WR => -1072894208

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_NONWHITESPACE => -1072894207

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_NSPREFIXDECLARED => -1072894206

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_NSPREFIXWITHEMPTYNSURI => -1072894205

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_DUPLICATEATTRIBUTE => -1072894204

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_XMLNSPREFIXDECLARATION => -1072894203

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_XMLPREFIXDECLARATION => -1072894202

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_XMLURIDECLARATION => -1072894201

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_XMLNSURIDECLARATION => -1072894200

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_NAMESPACEUNDECLARED => -1072894199

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_INVALIDXMLSPACE => -1072894198

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_INVALIDACTION => -1072894197

    /**
     * @type {Integer (Int32)}
     */
    static WR_E_INVALIDSURROGATEPAIR => -1072894196

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_INVALID_DECIMAL => -1072898019

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_INVALID_HEXIDECIMAL => -1072898018

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_INVALID_UNICODE => -1072898017

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_INVALIDENCODING => -1072897938
}
